# Run this script in a folder containing three files
# 1. hdb
# 2. hroster
# 3. pdb/*

# Put a backslash before $.*/[\]^ (but not inside bracket expressions).


mkdir Results

# HANDS
# convert hands csv             
sed -E 's/([0-9]) /\1, /g' hdb > Results/hdb.csv
# split the flop, turn, etc
sed -i -E 's/\//, /g' Results/hdb.csv
# rm temporary file
rm Results/hdb.csv-E 

# ROSTER
# convert roster csv
sed -E "s/([0-9A-Za-z]) /\1, /g" hroster > Results/hroster.csv
# group users into one column
sed -i -E 's/ \([0-9]\{1,2\}\), \(.*\)$/\1, [\2]/g' Results/hroster.csv
# rm temporary file
rm Results/hroster.csv-E 

# ACTIONS
# concat all pdb files
cat pdb/pdb.* >> Results/pdb.csv 
# convert to csv
sed -i -E 's/\([-0-9A-Za-z]\) /\1, /g' Results/pdb.csv
# remove temp
rm Results/pdb.csv-E

echo Finished