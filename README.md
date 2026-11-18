# ocu-auto

Automazione totale per OpenCode Unlimited su Termux.

Basta digitare `opencode` e il sistema:
1. Avvia il proxy (WARP userspace).
2. Apre OpenCode in una sessione tmux.
3. Avvia il supervisore che ruota l'IP in automatico quando finisci i limiti gratuiti.
4. Invia "continue" a OpenCode dopo la rotazione, senza che tu debba fare nulla.

## Installazione

```bash
curl -sL https://raw.githubusercontent.com/TUO-USER/ocu-auto/main/install.sh | bash
