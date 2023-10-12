### TerraAnsibleAzurePOC

#### Introduction:

TerraAnsibleAzurePOC est une solution automatisée permettant de déployer un serveur Active Directory sur une VM Azure ainsi qu'Azure Virtual Desktop. Utilisant Terraform pour le provisionnement des ressources et Ansible pour la configuration des VMs, le projet offre une méthodologie efficace pour déployer, surveiller, et gérer vos ressources Azure.

#### Documentation:

##### Prérequis:

1. Installer [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli).
2. Installer [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).
3. Disposer d'un compte Azure actif.

##### Clonage du dépôt:

```
git clone <url_du_dépôt.git>
```

##### Provisionnement des ressources avec Terraform:

1. Dirigez-vous vers le dossier de la fonctionnalité souhaitée, par exemple:

```
cd AD_Windows_Server/terraform
```

2. Initialisez Terraform:

```
terraform init
```

3. Affichez et vérifiez le plan d'exécution:

```
terraform plan
```

4. Appliquez les configurations:

```
terraform apply
```

Confirmez avec `yes` pour procéder.

##### Configuration des VMs avec Ansible:

1. Dirigez-vous vers le dossier Ansible de la fonctionnalité en question:

```
cd AD_Windows_Server/ansible
```

2. Lancez le playbook Ansible:

```
ansible-playbook -i hosts.ini playbook.yml
```

##### Surveillance et gestion:

- Utilisez Azure Monitor pour surveiller vos VMs et bureaux virtuels, déjà configuré via Terraform.
- Azure Security Center est à votre disposition pour des recommandations de sécurité.

##### Automatisation:

1. Azure Automation est prévu pour orchestrer l'arrêt et le démarrage des VMs.
2. Un mécanisme est en place pour éteindre l'environnement durant le week-end et le relancer le lundi.

##### Contribution:

Si vous souhaitez contribuer à TerraAnsibleAzurePOC :

1. Forkez le dépôt.
2. Créez une nouvelle branche (`git checkout -b feature/nouvelle-feature`).
3. Committez vos changements (`git commit -am 'Ajout d'une feature'`).
4. Poussez votre branche (`git push origin feature/nouvelle-feature`).
5. Ouvrez une Pull Request.
