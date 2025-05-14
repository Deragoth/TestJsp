Write-Host "🔍 Verifica della directory corrente..."
if (-Not (Test-Path ".git")) {
    Write-Host "❌ Errore: Non sei in un repository Git."
    exit 1
} else {
    Write-Host "✅ Sei in un repository Git."
}

Write-Host "🔍 Controllo dei riferimenti Git..."
if (-Not (git rev-parse --is-inside-work-tree 2>$null)) {
    Write-Host "❌ Non è stato possibile trovare i riferimenti Git."
    exit 1
} else {
    Write-Host "✅ I riferimenti Git sono presenti."
}

Write-Host "🔍 Controllo del tipo di clone..."
if (Test-Path ".git\shallow") {
    Write-Host "⚠️ Il clone è shallow. Esegui 'git fetch --unshallow' per scaricare tutti i commit."
} else {
    Write-Host "✅ Il clone è completo."
}

Write-Host "🔍 Elenco dei branch locali:"
git branch

Write-Host "🔍 Elenco dei branch remoti:"
git branch -r

Write-Host "🔍 Verifica dei ref per 'act'..."
if (-Not (act --list 2>$null)) {
    Write-Host "❌ 'act' non riesce a trovare i workflow. Verifica i file YAML in .github/workflows."
} else {
    Write-Host "✅ 'act' riesce a trovare i workflow."
}

Write-Host "🎉 Diagnostica completata."
