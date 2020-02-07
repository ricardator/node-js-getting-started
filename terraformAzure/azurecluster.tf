resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "azurecluster"
  location            = "westus"
  resource_group_name = "azuregroup"
  dns_prefix          = "dnsprefix1"


  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_A2"
  }

  service_principal {
    client_id     = "b2d19ddc-1a47-4b6b-8a48-265f8f6a842a"
    client_secret = "0f6ae567-fa81-49ae-8ef9-8091170079d1"
   }

}
