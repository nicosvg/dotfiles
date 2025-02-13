function yarn
    if test -e package-lock.json
        echo "This repository seems to uses npm instead of yarn"
        read -l -P 'Do you still want to use yarn? [y/N] ' confirm

        switch $confirm
            case Y y
                command yarn $argv
            case '' N n
                return
        end
    else if test -e bun.lockb
        echo "This repository seems to uses bun instead of yarn"
        read -l -P 'Do you still want to use yarn? [y/N] ' confirm

        switch $confirm
            case Y y
                command yarn $argv
            case '' N n
                return
        end
    else
        command npm $argv
    end
end
