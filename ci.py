#! /usr/bin/env python3
import os
import sys
import yaml
import git
import subprocess

tempdir = "/tmp"
targetdir = "ci"
config_file="pipeline.yml"
pipeline_name=sys.argv[1]
repo_address=sys.argv[2]





#def check_arguments() :
#Checa se os dois argumentos da linha de comando existem e sao validos


#erro se algo der errado.
#def clone_repo(address, directory):
try:
  git.Git(tempdir).clone(repo_address, targetdir)
  print("Repositorio clonado")
except:
  pass

os.chdir(tempdir + "/" + targetdir)

retval = os.getcwd()
print ("Current working directory %s" % retval)

#erro se o arquivo nao existir
#def load_config(filename):
file = open(config_file, "r")
data = yaml.safe_load(file) #a variavel precisa ser publica se nao so funciona dentro do metodo.





# erro se o passo nao existir na task
#def do_step(step_name):

#  else:
#    print("Task unknown")

#muda para o diretório dos fontes
#chdir

#def run_pipeline(pipeline_name):
for pipeline in data['pipelines']:
#  print("pipeline = " + str(pipeline))
  if pipeline['name'] == pipeline_name:
    for step in pipeline['tasks']:
#      print("pipeline_tasks = " + str(pipeline['tasks']))
#      print("step = " + str(step))
#      print("data_tasks = " + str(data['tasks']))
      if step in data['tasks']:
#        print(step)
        print(data['tasks'][step])
# precisa ser uma lista de argumentos
#        call((data['tasks'][step]))
        subprocess.run(data['tasks'][step], shell=True)
#        os.system(data['tasks'][step])



#def main():
#  try:
    #Check_arguments
#    print("Antes de clonar")
#    print(repo_address + temp_dir)
#    clone_repo(repo_address, temp_dir)
#    print("depois de clonar")
#    print("Antes de carregar o yaml")
#    data = load_config(temp_dir + "/" + target_dir + "/" + config_file)
#    print("depois de carregar o yaml")
#    print(data)
#    print("antes de rodar a pipeline")
#    run_pipeline(pipeline_name)
#    print("depois de rodar a pipeline")
#  except:
#    print("erro")

#main()
