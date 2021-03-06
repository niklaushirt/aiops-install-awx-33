#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#       __________  __ ___       _____    ________            
#      / ____/ __ \/ // / |     / /   |  /  _/ __ \____  _____
#     / /   / /_/ / // /| | /| / / /| |  / // / / / __ \/ ___/
#    / /___/ ____/__  __/ |/ |/ / ___ |_/ // /_/ / /_/ (__  ) 
#    \____/_/      /_/  |__/|__/_/  |_/___/\____/ .___/____/  
#                                              /_/            
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------------"
#  CP4WAIOPS v3.3 - CP4WAIOPS Installation
#
#
#  ©2022 nikh@ch.ibm.com
# ---------------------------------------------------------------------------------------------------------------"
# ---------------------------------------------------------------------------------------------------------------"
# ---------------------------------------------------------------------------------------------------------------"
# ---------------------------------------------------------------------------------------------------------------"

# ---------------------------------------------------------------------------------------------------------------"
# ---------------------------------------------------------------------------------------------------------------"
# Do Not Modify Below
# ---------------------------------------------------------------------------------------------------------------"
# ---------------------------------------------------------------------------------------------------------------"



clear

echo "*****************************************************************************************************************************"
echo "*****************************************************************************************************************************"
echo "*****************************************************************************************************************************"
echo "*****************************************************************************************************************************"
echo "  "
echo "  🐥 CloudPak for Watson AIOps v3.3 - Ansible Playbooks"
echo "  "
echo "*****************************************************************************************************************************"
echo "*****************************************************************************************************************************"
echo "*****************************************************************************************************************************"
echo "  "
echo "  "




export TEMP_PATH=~/aiops-install




runPlaybook () {
      echo ""
      echo ""
      echo ""
      echo ""
      echo ""
      echo "*****************************************************************************************************************************"
      echo "--------------------------------------------------------------------------------------------"
      echo " 🚀  Run Playbook: $ANSIBLE_PLAYBOOK" 
      echo "--------------------------------------------------------------------------------------------"
      echo "*****************************************************************************************************************************"
      echo ""

      FILE=./ansible/$ANSIBLE_PLAYBOOK.yaml
      if test -f "$FILE"; then
            echo "✅ Playbook found..."
            echo ""
            echo ""
            if [[ $ANSIBLE_PLAYBOOK =~ "01_AIManager-install" ]] || [[ $ANSIBLE_PLAYBOOK =~ "04_eventmanager-install" ]] || [[ $ANSIBLE_PLAYBOOK =~ "05_InfraManagement-install" ]] || [[ $ANSIBLE_PLAYBOOK =~ "09_AIManager-only" ]];  
            then
                  echo ""
                  echo ""
                  echo "  Enter CP4WAIOPS Pull token: "
                  read TOKEN
                  ansible-playbook $FILE -e ENTITLED_REGISTRY_KEY=$TOKEN
            else
                  ansible-playbook $FILE
            fi

      else
            echo "❌ Playbook doesn't exist. Try again...."
            echo ""
      fi
      echo ""
      echo ""
      echo ""
      echo ""
      echo "*****************************************************************************************************************************"
      echo "--------------------------------------------------------------------------------------------"
      echo " ✅  DONE" 
      echo "--------------------------------------------------------------------------------------------"
      echo "*****************************************************************************************************************************"
      echo ""
}



until [ "$selection" = "0" ]; do
  
      clear

      echo "*****************************************************************************************************************************"
      echo "*****************************************************************************************************************************"
      echo "      __________  __ ___       _____    ________            "
      echo "     / ____/ __ \/ // / |     / /   |  /  _/ __ \____  _____"
      echo "    / /   / /_/ / // /| | /| / / /| |  / // / / / __ \/ ___/"
      echo "   / /___/ ____/__  __/ |/ |/ / ___ |_/ // /_/ / /_/ (__  ) "
      echo "   \____/_/      /_/  |__/|__/_/  |_/___/\____/ .___/____/  "
      echo "                                             /_/            "
      echo ""
      echo "*****************************************************************************************************************************"
      echo " 🐥 CloudPak for Watson AIOPs - AVAILABLE ANSIBLE PLAYBOOKS"
      echo "*****************************************************************************************************************************"
      echo ""

      echo "-----------------------------------------------------------------------"
      echo "  🐥  Base Installation Playbooks"
      echo "  "

      ls -1 ./ansible | grep "^0"|grep -v "00"| sed 's/.yaml//'| sed 's/^/       /'

      echo "  "
      echo "  "
      echo "  "
      echo "-----------------------------------------------------------------------"
      echo "  🧨  Demo Addons Playbooks"
      echo "  "

      ls -1 ./ansible | grep -E "(11|12|13|14|16|17|19)"| sed 's/.yaml//'| sed 's/^/       /'



      echo "  "
      echo "-----------------------------------------------------------------------"
      echo "  📛  Addons Playbooks"
      echo "  "

      ls -1 ./ansible | grep "2._addons-ins"| sed 's/.yaml//'| sed 's/^/       /'



      echo "  "
      echo "-----------------------------------------------------------------------"
      echo "  🌏  Ingress and Routes Playbooks"
      echo "  "

      ls -1 ./ansible | grep -E "(3._)"| sed 's/.yaml//'| sed 's/^/       /'


      echo "  "
      echo "-----------------------------------------------------------------------"
      echo "  📚  Runbooks Playbooks"
      echo "  "

      ls -1 ./ansible | grep -E "(45|47|48|49)"| sed 's/.yaml//'| sed 's/^/       /'


      echo "  "
      echo "-----------------------------------------------------------------------"
      echo "  🔗  Topology Playbooks"
      echo "  "

      ls -1 ./ansible | grep -E "(80|81|82|83|84)"| sed 's/.yaml//'| sed 's/^/       /'


      echo "  "
      echo "-----------------------------------------------------------------------"
      echo "  🏃‍♂️  Training Playbooks"
      echo "  "

      ls -1 ./ansible | grep -E "(85|86|87)"| sed 's/.yaml//'| sed 's/^/       /'

      echo "  "
      echo "-----------------------------------------------------------------------"
      echo "  📥  AWX Easy Install Playbooks"
      echo "  "

      ls -1 ./ansible | grep -E "(40|41)"| sed 's/.yaml//'| sed 's/^/       /'



      echo "  "
      echo "  "
      echo "-----------------------------------------------------------------------"
      echo "  ❌    0  -  Exit"



      echo ""
      echo ""
      echo "  🚀 Copy and paste the name of the Playbook you want to run below: "
      read selection
      echo ""

      if [ $selection != "0" ];  then
            export ANSIBLE_PLAYBOOK=$selection
            runPlaybook

            read -p "Press Enter to continue..."
            clear 
      fi
done


