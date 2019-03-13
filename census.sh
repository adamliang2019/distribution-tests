> census.txt

directories=$(ls -d ./*)

for d in $directories
do

    array=("./hovDependent" "./hovIndependent" "./normalityMultivariate" "./normalityUnivariate" "./shapeMultivariate" "./shapeUnivariate")

    [[ "${array[@]}" =~ "$d" ]] && echo "$d"

    files=$(find $d | grep "\.R")
    for i in $files
    do
	test=$(cat $i | grep "method" | grep -o "\".*\"" | tr -d "\"")
	doi=$(cat $i | grep -o "https://doi.org.*")
	link=$(cat $i | grep -o "https://github.com.*")

	[ ! -z "$test" ] && echo "  " $test >> census.txt
	[ ! -z "$doi" ] && echo "    " $doi >> census.txt
	[ ! -z "$link" ] && echo "    " $link >> census.txt

    done

done