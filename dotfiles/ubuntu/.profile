# ~/.profile: executed by Bourne-compatible login shells.

# anyenv                                    
export ANYENV_ROOT=${HOME}/.anyenv          
export PATH=${ANYENV_ROOT}/bin:${PATH}      
eval "$(anyenv init -)"                     
                                            
# pyenv                                     
export PYENV_ROOT=${HOME}/.anyenv/envs/pyenv
export PATH=${PYENV_ROOT}/bin:${PATH}       
eval "$(pyenv init -)"                      
export PIPENV_VENV_IN_PROJECT=true          
eval "$(pipenv --completion)"               

# goenv                                     
export GOENV_ROOT=${HOME}/.anyenv/envs/goenv
export PATH=${GOENV_ROOT}/bin:${PATH}       
eval "$(goenv init -)"                      
export PATH=${GOPATH}/bin:${PATH}           

# direnv                  
eval "$(direnv hook bash)"

PATH=${PATH}:${HOME}/bin
export PATH

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

# mesg n || true
if `tty -s`; then
  mesg n
fi
