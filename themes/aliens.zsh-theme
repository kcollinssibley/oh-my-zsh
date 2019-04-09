# Copyright (c) 2018 Kofi Collins-Sibley (colko818@gmail.com)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

prompt_info () {
    local PROMPT_INFO
    local GIT_INFO="$(git_prompt_info)"
    local VENV_INFO="$(virtualenv_prompt_info)"

    if [[ "x${GIT_INFO}" != "x" ]]; then
        #local GIT_STATUS="$(git_prompt_status)"
        #local GIT_REMOTE="$(git_remote_status)"

        PROMPT_INFO="${PROMPT_INFO}${GIT_INFO}"

        #if [[ "x${GIT_STATUS}" != "x" ]]; then
        #    PROMPT_INFO="${PROMPT_INFO}|${GIT_STATUS}|"
        #fi

        #if [[ "x${GIT_REMOTE}" != "x" ]]; then
        #    PROMPT_INFO="${PROMPT_INFO}|${GIT_REMOTE}|"
        #fi
    fi

    if [[ "x${VENV_INFO}" != "x" ]]; then
        PROMPT_INFO="${PROMPT_INFO}${VENV_INFO}"
    fi

    if [[ "x${PROMPT_INFO}" != "x" ]]; then
        echo " ${PROMPT_INFO}"
        return 0
    fi

    echo ""
    return 0
}

# emojis: 👽👾😈💀🤯😎
PROMPT=''\
'👽 %{$fg[red]%}%n%{$reset_color%}@%{$fg_bold[black]%}%m%{$reset_color%} '\
'%{$fg[green]%}%c%{$reset_color%}$(prompt_info)%{$reset_color%} ᐵ '

# GIT_INFO
ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_colors%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"

# GIT_STATUS
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚑ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%}◒ %{$reset_color%}"

# GIT_REMOTE
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg_bold[magenta]%}⇃%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg_bold[magenta]%}↿%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg_bold[magenta]%}⇌%{$reset_color%}"

# VENV_INFO
ZSH_THEME_VIRTUALENV_PREFIX="{%{$fg_bold[yellow]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%}}"

MODE_INDICATOR="%{$fg[red]%}VI%{$reset_color%}"
