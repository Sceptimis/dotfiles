function fish_prompt --description 'Write out the prompt'
    set -l normal (set_color normal)
    set -l white (set_color white)

    echo -n $white(prompt_pwd) ">" $normal
end
