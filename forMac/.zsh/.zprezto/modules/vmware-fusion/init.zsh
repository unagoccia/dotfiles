# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

export PATH=$PATH:/Applications/VMware\ Fusion.app/Contents/Library
VM_MACHINES_DIR="${HOME}/Documents/Virtual Machines.localized"

# aliases
alias vmlist='vmrun -T fusion list'
#alias vmstart='vmrun -T fusion start'
#alias vmsuspend='vmrun -T fusion suspend'
#alias vmstop='vmrun -T fusion stop'

select_startvm () {
    vm_machines=()
    selected_vm=""
    for filepath in "${VM_MACHINES_DIR}"/*.vmwarevm; do
        if [ -d "${filepath}" ] ; then
            vm_machines+=("${filepath}")
        fi
    done

    if [[ $#vm_machines -ge 1 ]]; then
        echo "VM一覧"
        i=1
        for vm_machine in "${vm_machines[@]}"; do
            vm_name=`basename "${vm_machine}"`
            echo "${i}) ${vm_name}"
            i=$((i+1))
        done

        echo -n "\nselect:"
        read selected_num
        selected_vm="${vm_machines[${selected_num}]}"
    else
        echo "vm isn't exist."
    fi
}

select_stopvm () {
    ORG_IFS=$IFS
    IFS=$'\n'
    vm_machines=()
    selected_vm=""
    vm_machines=($(vmlist))
    vm_machines=(${vm_machines[2,$#vm_machines]})

    if [[ $#vm_machines -ge 1 ]]; then
        echo "VM一覧"
        i=1
        for vm_machine in "${vm_machines[@]}"; do
            vm_name=`basename "${vm_machine}"`
            echo "${i}) ${vm_name}"
            i=$((i+1))
        done

        echo -n "\nselect:"
        read selected_num
        selected_vm="${vm_machines[${selected_num}]}"
    else
        echo "alive vm isn't exist."
    fi
    IFS="${ORG_IFS}"
}

vmstart () {
    if [[ -z "$1" ]]; then
        select_startvm
    else
        selected_vm="$1"
    fi

     if [[ -z "${selected_vm}" ]]; then
     	echo "vm isn't selected."
     else
         vmrun -T fusion start "$selected_vm" nogui
     fi
}

vmstop () {
    if [[ -z "$1" ]]; then
        select_stopvm
    else
        selected_vm="$1"
    fi

     if [[ -z "${selected_vm}" ]]; then
     	echo "vm isn't selected."
     else
         vmrun -T fusion stop "$selected_vm" soft
     fi
}

vmsuspend () {
    if [[ -z "$1" ]]; then
        select_stopvm
    else
        selected_vm="$1"
    fi

     if [[ -z "${selected_vm}" ]]; then
     	echo "vm isn't selected."
     else
         vmrun -T fusion suspend "$selected_vm"
     fi
}
