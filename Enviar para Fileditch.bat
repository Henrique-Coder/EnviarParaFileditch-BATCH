:: Batch desenvolvido por: FireHDPower#5551

@echo off

:: Setando cor do texto no CMD
color F >nul 2>&1

:: Avisos legais para ler antes do uso do script e criador do código
echo - ANTES DE UPAR QUALQUER ARQUIVO, LEIA OS TERMOS DO SITE FILEDITCH: https://fileditch.com/faq.html
echo - ARQUIVOS COM EXTENSOES POTENCIALMENTE PERIGOSAS, COMO .EXE, NAO SERAO ENVIADAS AO SITE
echo - VIDEOS E IMAGENS SAO PERMITIDAS, PARA UPAR OUTRO TIPO DE ARQUIVO, ZIPE PARA EVITAR ERROS
echo - O SCRIPT SUPORTA APENAS UM UPLOAD POR VEZ, CASO SELECIONE DOIS OU MAIS, TERA ERROS
echo.
echo CLIQUE EM QUALQUER TECLA PARA INICIAR O UPLOAD DO ARQUIVO - Criador: FireHDPower#5551 - %date% - %time%

:: Clique em qualquer tecla para continuar o upload do arquivo
pause >nul 2>&1

:: Limpando a tela do CMD e repassando os avisos legais seguido do upload em tempo real
cls
echo - ANTES DE UPAR QUALQUER ARQUIVO, LEIA OS TERMOS DO SITE FILEDITCH: https://fileditch.com/faq.html
echo - ARQUIVOS COM EXTENSOES POTENCIALMENTE PERIGOSAS, COMO .EXE, NAO SERAO ENVIADAS AO SITE
echo - VIDEOS E IMAGENS SAO PERMITIDAS, PARA UPAR OUTRO TIPO DE ARQUIVO, ZIPE PARA EVITAR ERROS
echo - O SCRIPT SUPORTA APENAS UM UPLOAD POR VEZ, CASO SELECIONE DOIS OU MAIS, TERA ERROS
echo.
echo.

:: Upando arquivo para o Fileditch e criando arquivo de texto com o link do arquivo enviado
curl -i -F files[]=@%1 https://up1.fileditch.com/upload.php | findstr "\"url\"" > %temp%/sendto-fileupload-link.txt

:: Verificando arquivo de texto e limpando caracteres
set /p link_upload=< %temp%/sendto-fileupload-link.txt
set link_upload=%link_upload:"url":=%
set link_upload=%link_upload:"=%
set link_upload=%link_upload:,=%
set link_upload=%link_upload: =%
set link_upload=%link_upload:\/=/%

:: Copiando link de upload para a área de transferência
echo %link_upload% | clip

:: Mostrando o link e diretorio do arquivo enviado
echo.
echo.
echo O link de download/embed foi copiado para a area de transferencia
echo.
echo - Diretorio: %1
echo - Link: %link_upload%
pause >nul 2>&1