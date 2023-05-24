# Amosa a data.
Get-Date

#Lista os directorios ou arquivos que hai en Windows/System32 e que o seu nome comece por w.
Get-ChildItem -Path "C:Windows\System32" -filter w*
  
#Fai a seguinte estrutura de directorios e arquivos:
     <# C:
          SISTEMAS
          DOS
          MANUAL
              manual.txt
          EXERCICIOS
              folla1.txt
              folla2.txt #>
New-Item -Path "C:SISTEMAS", "C:DOS", "C:MANUAL", "C:EXERCICIOS" -ItemType directory
New-Item -Path "C:MANUAL\manual.txt", "C:EXERCICIOS\folla1.txt", "C:EXERCICIOS\folla2.txt"
             
# Copia todos os ficheiros do directorio ejercicios a C cunha soa orde.
Copy-Item -Path "C:EXERCICIOS\*" -Destination "C:" -Recurse

# Crea un directorio en C que se chame PRACTICA2 e copia o ficheiro LABEL.EXE do subdirectorio SYSTEM32 de WINDOWS en PRACTICA2 pero co nome ETIQUETA.EXE. Podes utilizar 2 comandos.
New-Item -Path "C:PRACTICA2" -ItemType directory
Copy-Item -Path "C:Windows\System32\Label.exe" -Destination "C:PRACTICA2\ETIQUETA.exe"

# Copia todos os ficheiros do directorio EXERCICIOS a PRACTICA2 cunha soa orde.
Copy-Item -Path "C:EXERCICIOS\*" -Destination "C:PRACTICA2"

# Copia todos os ficheiros do directorio PRACTICA2 que teñen extensión txt no directorio DOS pero coa extensión sol, cunha soa orde.
Get-ChildItem -Path "C:PRACTICA2\*.txt" | Rename-Item -NewName { $_.Name -replace ".txt" , ".sol"} | Copy-Item "C:DOS\"  

# Con ruta absoluta renomea o ficheiro folla1.sol que se atopa en DOS como folla.dat
Rename-Item -Path "C:DOS\folla1.sol" -NewName "folla.dat"

# Copia todo o directorio Sistemas noutro directorio chamado CopySist cunha soa orde.
Copy-Item -Path "C:SISTEMAS" -Destination "C:CopySist" -Recurse

# Ubícate na túa carpeta de usuario con ruta absoluta.
Set-Location -Path "\Users\$env:USERNAME"

# Utilizando ruta relativa borra o directorio CopySist
Remove-Item -Path "\CopySist" -Recurse

# Pon atributo oculto ao arquivo folla.dat que hai no directorio DOS. Tes que facer algo especial para listar dito arquivo oculto?
$archivoOculto= Get-Item -Path "C:\DOS\folla.dat"
$archivoOculto.Attributes='Hidden'
Get-ChildItem -Path "C:\DOS" # Non amosa nada, o arquivo está oculto
Get-ChildItem -Path "C:\DOS" -Force # Amosa incluso arquivos ocultos

# Cambia ao directorio DOS e, utilizando direccionamiento (>), crea un arquivo novo chamado folla.txt
Set-Location -Path \DOS > folla.txt

# Amosa por pantalla o contido de folla.dat e folla.txt (2 comandos).
Get-Content -Path "C:\DOS\folla.dat"
Get-Content -Path "C:\DOS\folla.txt"

# Engade o contido de folla.txt a folla.dat sen borrar o que hai en folla.dat.
Get-Content -Path "C:\DOS\folla.txt" | Add-Content -Path "C:\DOS\folla.dat"