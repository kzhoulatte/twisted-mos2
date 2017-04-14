#!/bin/bash

echo "Hello,jobs starts now:"

cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100/T1/
sbatch run_qe_trans_dk.sh

cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100/T2/
sbatch run_qe_trans_dk.sh

cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100/T3/
sbatch run_qe_trans_dk.sh

cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100/T4/
sbatch run_qe_trans_dk.sh

cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100/T5/
sbatch run_qe_trans_dk.sh

cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100/T6/
sbatch run_qe_trans_dk.sh

cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100/T7/
sbatch run_qe_trans_dk.sh

echo "All jobs submitted. Do check it"
