<# TREEFOLDER v_1.0

Copyright (C) 2018 Cannavo' Michele

Tutti i diritti Riservati

   TREEFOLDER is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
   TREEFOLDER is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.
   You should have received a copy of the GNU General Public License
    along with TREEFOLDER. If not, see <http://www.gnu.org/licenses/>.


#>

# Inserire il nome del progetto, sar� la cartella principale
$nameProject = read-host -prompt "Nome     del progetto"

# Inserire il percorso di dove gestire il progetto.
# TODO: Lasciare vuoto per inserirlo nella stessa cartella
$dirWork     = read-host -prompt "Percorso del progetto"

# Salva l'attuale posizione per uso interno dello script
$actuallyDir = Get-Location



<# Controllo se il file TreeFolfder.txt � presente
   Se non lo e' esco dallo script #>
$FileExists = Test-Path  ".\TreeFolder.txt" 
If ($FileExists -eq $False) {
    Write-Host "Non � stato trovato il file contenente l'elenco delle cartelle"
    Exit 
}

# Legge il file e ne copia il contenuto nella variabile Computers
$Computers = Get-Content -Path .\TreeFolder.txt

# Mi sposto nella cartella dove creare il progetto 
Set-Location -Path $dirWork 
# e creo la cartella di base
New-Item -Path $nameProject -ItemType "directory"

# Serve a creare una vasriabile con il percorso della cartella base del progetto
$dirWork = $dirWork + "\" + $nameProject
# e mi ci sposto dentro
Set-Location -Path $dirWork

# Creo l'albero delle cartella come strutturato nel file TreeFolder.txt
New-Item -Path $Computers -ItemType "directory"



# Permette di vedere se tutto � andato liscio
$name = read-host -Prompt 'Premi un tasto per uscire'