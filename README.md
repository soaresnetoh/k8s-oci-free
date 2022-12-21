
# Projeto K8S-OCI

Este projeto foi baseado no repositório de Jerrome que tem um projeto em terrraform para subir um cluster k8s usando somente a conta na camada free... Visite lá e conheça... é top: [Jérôme Petazzoni - Ampernetacle](https://github.com/jpetazzo/ampernetacle)

=========================

Aqui vamos fazer um passo a passo via branch mostrando como subir as maquinas (caso não queiram usar como cluster k8s) e depois fazer o processo de subir o cluster.

=========================

Pre-requisito:

- 
1. Criar uma conta na [OCI](https://www.oracle.com/cloud/sign-in.html) (conta esta que, apesar de ter que cadastrar o cartão de crédito, existem varios recursos da camada always free).
2. Ter [instalado kubernetes](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#installing-kubeadm-kubelet-and-kubectl).
3. Ter [instalado terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/oci-get-started).
4. Ter [instalado OCI CLI ](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm).
5. Configurar [OCI credentials](https://learn.hashicorp.com/tutorials/terraform/oci-build?in=terraform/oci-get-started).
6. Baixar este projeto e acessar a pasta.
7. Selecionar a branch que deseja testar = git checkout <branch>.
8. `terraform init`
9. `terraform apply`

Como Bonus, deixo aqui video que irá ser crucial para que voce não seja cobrado por recursos criados indevidamente... o [Andrei Rubino](https://www.youtube.com/@AndreiRubino) dá todo o passo a passo para fazer a configuração certa...
[Oracle Cloud - Upgrade Sem Medo e Sem Custos (HANDS-ON)](https://www.youtube.com/watch?v=U_slvZjrez0)