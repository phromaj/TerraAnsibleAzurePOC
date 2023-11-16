### Cahier des Charges : Mise en place d'un environnement Active Directory et Azure Virtual Desktop

#### 1. **Provisionnement de la VM et installation d'Active Directory** :
    - Provisionner une VM Windows Server dans Azure à l'aide de Terraform.
    - Utiliser Ansible pour :
        - Installer et configurer le rôle Active Directory Domain Services sur la VM Windows Server.
        - Promouvoir cette VM en tant que contrôleur de domaine.

#### 2. **Configuration des comptes Active Directory** :
    - Avec Ansible, créer trois comptes d'utilisateur au sein du service Active Directory installé sur la VM Windows Server.

#### 3. **Déploiement et configuration d'Azure Virtual Desktop (AVD)** :
    - Avec Terraform, provisionner l'environnement Azure Virtual Desktop.
    - Configurer l'hôte AVD pour utiliser le mode Windows 10 Mono-user.
    - Assurer l'intégration des postes de travail virtuels avec le serveur Active Directory provisionné précédemment.
    - Connecter les VMs Windows à un Host Pool AVD en utilisant un token.
    - Établir une liaison entre AVD et AD on-premise dans un même réseau via Azure AD Connect.
    - Gérer les groupes d'applications pour les utilisateurs AD.
    - Attribuer aux utilisateurs l'accès aux groupes d'applications ou aux bureaux virtuels dans AVD.
    - Veiller à ce que les bureaux virtuels soient accessibles via les comptes créés dans Active Directory.

#### 4. **Automatisation avec Logic Apps** :
    - Utiliser Logic Apps pour orchestrer l'arrêt et le démarrage automatique des VMs.
    - Configurer un processus automatique dans Logic Apps pour éteindre l'environnement durant le week-end et le redémarrer le lundi.

#### 5. **Surveillance avec Azure Monitor** :
    - Intégrer Azure Monitor, via Terraform, pour assurer la surveillance continue des VMs et des bureaux virtuels.

#### 6. **Gestion des appareils via MDM** :
    - À l'aide de Terraform, déployer une solution MDM afin de gérer et sécuriser les bureaux virtuels.
    - Intégrer, via Ansible, les outils NGOT et OneMS pour une gestion et surveillance optimales.

#### 7. **VM dédiée à la surveillance, sauvegarde et gestion des accès** :
    - Provisionner, à l'aide de Terraform, une VM capable d'exécuter à la fois Windows et Linux.
    - Utiliser Ansible pour la configuration spécifique de cette VM qui sera dédiée à la surveillance, la sauvegarde, et la gestion des accès.

#### 8. **Optimisation et renforcement de la sécurité** :
    - S'assurer, à travers Terraform et Ansible, que toutes les VMs et les bureaux virtuels soient configurés conformément aux meilleures pratiques de sécurité.
    - Intégrer Azure Security Center pour obtenir et appliquer les recommandations de sécurité.

#### 9. **Gestion du cycle de vie** :
    - Lors de la destruction d'un bureau virtuel, configurer un mécanisme pour s'assurer que le service Active Directory sur la VM Windows Server est également arrêté pour garantir la cohérence de l'environnement.