OUTPUT=`terraform output -state="coding/github/my-net/scripts/terraform/sol/hiag/k8sswiss/terraform.tfstate" control_machine_address`
IP=`echo $OUTPUT | awk -F':' '{print $1}'`
PORT=`echo $OUTPUT | awk -F':' '{print $2}'`

OUTPUT=`terraform output -state="coding/github/my-net/scripts/terraform/sol/hiag/k8sswiss/terraform.tfstate" master_ips`
MIPS=()
MIPS_INDEX=`echo "$OUTPUT" | wc -l`
MIPS_INDEX=$MIPS_INDEX-1
for i in $(echo $OUTPUT | tr "," "\n")
do
    MIPS[$MIPS_INDEX]=$i
done

OUTPUT=`terraform output -state="coding/github/my-net/scripts/terraform/sol/hiag/k8sswiss/terraform.tfstate" master_names`
MVMS=()
MVMS_INDEX=`echo "$OUTPUT" | wc -l`
MVMS_INDEX=$MVMS_INDEX-1
for i in $(echo $OUTPUT | tr "," "\n")
do
    MVMS[$MVMS_INDEX]=$i
done

OUTPUT=`terraform output -state="coding/github/my-net/scripts/terraform/sol/hiag/k8sswiss/terraform.tfstate" worker_ips`
WIPS=()
WIPS_INDEX=`echo "$OUTPUT" | wc -l`
WIPS_INDEX=$WIPS_INDEX-1
for i in $(echo $OUTPUT | tr "," "\n")
do
    WIPS[$WIPS_INDEX]=$i
done

STATEFILE="coding/github/my-net/scripts/terraform/sol/hiag/k8sswiss/terraform.tfstate"
FILTER="worker_names"
OUTPUT=`terraform output -state="$STATEFILE" $FILTER`
WVMS=()
declare -i WVMS_INDEX=0
for i in $(echo $OUTPUT | tr "," "\n")
do
    WVMS[$WVMS_INDEX]=$i
    declare -i WVMS_INDEX=$WVMS_INDEX+1
done

STATEFILE="coding/github/my-net/scripts/terraform/sol/hiag/k8sswiss/terraform.tfstate"
FILTER="worker_names"
OUTPUT=`terraform output -state="$STATEFILE" $FILTER`
WVMS=()
WVMS=`coding/github/my-net/scripts/bash/handlers/var.sh 'var.array.fill.delimeter' "$OUTPUT"`