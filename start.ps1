$requirements_name = "requirements.txt"
$venv_name = "venv"


$root = $PSScriptRoot
$requirements = $root + "\" + $requirements_name
$venv = $root + "\" + $venv_name

cd $root

if (Test-Path -Path $venv)
{
    iex (".\" + $venv_name + "\Scripts\activate")
}

if ((Test-Path -Path $requirements) -and !(Test-Path -Path $venv))
{
    python -m venv $venv_name
    iex (".\" + $venv_name + "\Scripts\activate")
    pip install -r $requirements_name
}

python -m notebook