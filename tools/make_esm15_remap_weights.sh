#!/bin/bash
#PBS -P tm70
#PBS -q normal
#PBS -l ncpus=8,mem=32GB,walltime=01:00:00,jobfs=32GB
#PBS -l wd
#PBS -l storage=gdata/hh5+gdata/ik11+gdata/rt52+gdata/p66+gdata/access+scratch/p66

module purge
module load python3-as-python
module load nco
module use /g/data/hh5/public/modules
module load conda/analysis3
module unload openmpi
module load openmpi/4.0.2

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/g/data/p66/mrd599/access_cm2_025_remap_weights

# Make all 1 deg weights.
# time ./make_cm2_remap_weights.py --npes 8 --ocean MOM1 \
#       --accessom2_input_dir /g/data/ik11/inputs/access-om2/input_20201102 \
#       --atm n96e --ignore_unmapped --unmasked_src --unmasked_dest --src ocn

COMMON_ARGS="--npes 8 --ocean MOM1 \
      --accessom2_input_dir /g/data/access/projects/access/access-cm2/input_O1 \
      --maskfile /g/data/access/projects/access/access-cm2/input_O1/cpl_n96_20230404/oasis3_masks_n96_O1.nc \
      --ignore_unmapped --prefix remap"

time ./make_access_cm_remap_weights.py $COMMON_ARGS \
      --atm n96_t --src atm  --method=bilinear --norm_type=dstarea

time ./make_access_cm_remap_weights.py $COMMON_ARGS \
      --atm n96_t --src atm --method=conserve --norm_type dstarea

time ./make_access_cm_remap_weights.py $COMMON_ARGS \
     --atm n96_t --src ocn --method=conserve --norm_type fracarea

time ./make_access_cm_remap_weights.py $COMMON_ARGS \
     --atm n96_u --src ocn --method=conserve --norm_type fracarea

time ./make_access_cm_remap_weights.py $COMMON_ARGS \
     --atm n96_v  --src ocn --method=conserve --norm_type fracarea

time ./make_access_cm_remap_weights.py $COMMON_ARGS \
     --atm n96_u --src atm --method=patch --norm_type dstarea

time ./make_access_cm_remap_weights.py $COMMON_ARGS \
     --atm n96_v  --src atm --method=patch --norm_type dstarea


# time ./make_cm2_remap_weights.py --npes 8 --ocean MOM1 \
#       --accessom2_input_dir /g/data/ik11/inputs/access-om2/input_20201102 \
#       --atm n96e --ignore_unmapped --unmasked_src --unmasked_dest --src atm
