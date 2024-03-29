#!/bin/bash
#SBATCH --nodes=20
###SBATCH --nvmps
#SBATCH --gres=gpu:2
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=40
#SBATCH --time=12:00:00
#SBATCH --partition=p.talos
#SBATCH --job-name=name
#SBATCH --output=name-%j.out
#SBATCH --error=name-%j.error


#ulimit -s unlimited
#module load  intel/19.1.3 impi/2019.9   boost/1.73  mkl/2020.4
#module load git/2.35 intel/21.6.0 impi/2021.6 boost/1.73 anaconda/3/2019.03 mkl/2020.4 cuda/11.4 cmake/3.22 vtune/2022.2
#module load intel/21.7.1   impi/2021.7   mkl/2022.2   cuda/11.4
#export LD_LIBRARY_PATH=$I_MPI_ROOT/intel64/lib/:$I_MPI_ROOT/intel64/lib/release/:$LD_LIBRARY_PATH

ulimit -s unlimited
#module load git/2.39 intel/21.6.0 impi/2021.6 boost/1.73 anaconda/3/2019.03 mkl/2020.4 cuda/11.2 cmake/3.22 vtune/2022.2
module load anaconda/3/2023.03  mkl/2023.1   cmake/3.22   intel/2023.1.0.x  impi/2021.9
source /mpcdf/soft/SLE_15/packages/x86_64/intel_oneapi/2022.3/compiler/latest/env/vars.sh
export LD_LIBRARY_PATH=$I_MPI_ROOT/intel64/lib/:$I_MPI_ROOT/intel64/lib/release/:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=$FI_PROVIDER_PATH/:$FI_PROVIDER_PATH/../:$I_MPI_ROOT/lib/:$I_MPI_ROOT/lib/release/:$LD_LIBRARY_PATH:/u/yiy/scratch/sisso_parameteric/cpp_sisso/third_party/boost/intel-llvm-linux/2023.1.0/lib64; unset I_MPI_HYDRA_BOOTSTRAP; unset I_MPI_PMI_LIBRARY;
#unset I_MPI_HYDRA_BOOTSTRAP; unset I_MPI_PMI_LIBRARY;

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

# For pinning threads correctly:
export OMP_PLACES=cores

#AIMS=/u/yiy/scratch/aims/FHIaims/build_Apr7_2023_cpu/aims.x
AIMS=/u/yiy/scratch/aims/FHIaims_cbmvbm_cube/build_Jul29_2023_cpu/aims.x
srun $AIMS > aims.out
