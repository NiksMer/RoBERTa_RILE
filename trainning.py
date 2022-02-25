# %%
# Setup

## Packages
import pandas as pd
import numpy as np
import torch
from transformers import RobertaForSequenceClassification, TrainingArguments, Trainer, RobertaTokenizer, RobertaConfig
from datasets import load_metric, load_dataset
from sklearn.metrics import precision_recall_fscore_support, accuracy_score
from tqdm import tqdm

## Cuda
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
n_gpu = torch.cuda.device_count()


####### Model Config ############

## Modelname
model_to_use = "roberta-base"
trained_model_name = "RoBERTa-RILE"

## Anzahl Labels
label_count = 3

## Anzahl Epochs
epoch_count = 5

## Batch Size
batch_size = 16

####### Data Config ############

## Train Data
train_data = "00_Data/trainingsdaten_rile_23022022.csv"

## Valid Data
valid_data = "00_Data/validierungsdaten_rile_23022022.csv"

# Delimeter
delimeter_char = ","

####### Functions ############

def tokenize_function(examples):
    return tokenizer(examples["text"], padding="max_length", truncation=True)


## Neue Metrics function: https://huggingface.co/transformers/v3.0.2/training.html#trainer
def compute_metrics(pred):
    labels = pred.label_ids
    preds = pred.predictions.argmax(-1)
    precision, recall, f1_micro, _ = precision_recall_fscore_support(labels, preds, average='micro')
    precision2, recall3, f1_macro, _ = precision_recall_fscore_support(labels, preds, average='macro')
    precision3, recall4, f1_weighted, _ = precision_recall_fscore_support(labels, preds, average='weighted')
    acc = accuracy_score(labels, preds)
    return {
        'accuracy': acc,
        'f1-micro': f1_micro,
        'f1-macro': f1_macro,
        'f1-weighted': f1_weighted,
        'precision': precision,
        'recall': recall
    }

# %%
# Daten laden
raw_datasets  = load_dataset('csv',data_files={'train':[train_data],'validation':[valid_data]},delimiter=delimeter_char)

# %%
# config
config = RobertaConfig(model_to_use)
# Tokenizer
tokenizer = RobertaTokenizer.from_pretrained(model_to_use,config=config)

tokenized_datasets = raw_datasets.map(tokenize_function, batched=True)

# %%
# Trainer Argumente
training_args = TrainingArguments(
    output_dir=trained_model_name,
    evaluation_strategy="epoch",
    num_train_epochs=epoch_count,
    per_device_train_batch_size=batch_size,
    overwrite_output_dir=True,
    per_device_eval_batch_size=batch_size,
    save_strategy="epoch",
    logging_dir='logs',        
    logging_steps=1)

# %%
model = RobertaForSequenceClassification.from_pretrained(model_to_use, num_labels=label_count)

# %%
trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=tokenized_datasets["train"],
    eval_dataset=tokenized_datasets["validation"],
    compute_metrics=compute_metrics,
)

# %%
trainer.train()
# %% 
# Abspeichern

## Log speichern
with open('log.json', 'w',encoding='utf-8') as f:
    f.truncate(0) # Vorher File leeren
    for obj in trainer.state.log_history:
        f.write(str(obj))

## Modell speichern
trainer.save_model (trained_model_name)

# %%
