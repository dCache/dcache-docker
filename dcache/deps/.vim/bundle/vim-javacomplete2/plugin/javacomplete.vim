" Java complete plugin file
" Maintainer:	artur shaik <ashaihullin@gmail.com>

command! JCimportsAddMissing call javacomplete#imports#AddMissing()
command! JCimportsRemoveUnused call javacomplete#imports#RemoveUnused()
command! JCimportAdd call javacomplete#imports#Add()
command! JCimportAddI call javacomplete#imports#Add(1)

command! JCserverShowPort call javacomplete#server#ShowPort()
command! JCserverShowPID call javacomplete#server#ShowPID()
command! JCserverStart call javacomplete#server#Start()
command! JCserverTerminate call javacomplete#server#Terminate()
command! JCserverCompile call javacomplete#server#Compile()

command! JCdebugEnableLogs call javacomplete#logger#Enable()
command! JCdebugDisableLogs call javacomplete#logger#Disable()
command! JCdebugGetLogContent call javacomplete#logger#GetContent()

command! JCcacheClear call javacomplete#ClearCache()

command! JCstart call javacomplete#Start()

autocmd Filetype java JCstart
