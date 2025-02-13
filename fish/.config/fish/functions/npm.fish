function npm
    if test -e yarn.lock
        echo "This repository seems to uses yarn instead of npm."
        read -l -P 'Do you still want to use npm? [y/N] ' confirm

        switch $confirm
            case Y y
                command npm $argv
            case '' N n
                return
        end
    else if test -e bun.lockb
        echo "This repository seems to uses bun instead of npm."
        read -l -P 'Do you still want to use npm? [y/N] ' confirm

        switch $confirm
            case Y y
                command npm $argv
            case '' N n
                return
        end
    else
        command npm $argv
    end
end
