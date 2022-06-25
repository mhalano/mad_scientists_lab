#! /usr/bin/env python3
import os
import sys
import YAML as yaml
import git

temp_dir=/tmp/ci
config_file=pipeline.Yml




Pipeline_name=argumento 1
Repo_address=argumento 2

Def Check_arguments() :
Checa se os dois argumentos da linha de comando existem e são validos

Def load_yaml(file):
Data = yaml.load(file) #a variável precisa ser publica se não só funciona dentro do método. 

Def clone_repo(repo):
# como fazer isso suportar múltiplos tipos de repositório? Git, mercurial, subversion
git.Git(temp_dir).clone(repo_address) 


Def Run_pipeline (pipeline_name):
Talvez tenha que rodar um for para olhar dentro de todas as pipelines até achar a certa 


For pipeline in data['pipelines']['name']:
If pipeline == pipeline_name
 For step in pipeline['tasks']:
   Sys. Exec data['tasks'] [step] 

Def main:
Try:
Check_arguments
Load_yaml(temp_dir + config_file) 
Clone_repo(repo) 
Run_pipeline
Except:

Carrega o arquivo yaml
