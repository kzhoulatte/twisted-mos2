#!/bin/bash

echo "Hello,have u changed the E K settings?  Cleaning and preparing for jobs now:"

cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100/T1/
rm -fr mos2* cond* output*
cp -r ../mos2.save/ .

cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100/T2/
rm -fr mos2* cond* output*
cp -r ../mos2.save/ .

cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100/T3/
rm -fr mos2* cond* output*
cp -r ../mos2.save/ .

cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100/T4/
rm -fr mos2* cond* output*
cp -r ../mos2.save/ .

cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100/T5/
rm -fr mos2* cond* output*
cp -r ../mos2.save/ .

cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100/T6/
rm -fr mos2* cond* output*
cp -r ../mos2.save/ .

cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100/T7/
rm -fr mos2* cond* output*
cp -r ../mos2.save/ .

echo "Clean and Prepare Done"
