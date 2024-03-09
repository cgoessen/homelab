# homelab

Collections of notes, scripts and other resources to create my homelab.

## Motivations

Over reliance on external service provider and ad-hoc home IT infrastructure have caused me to lose some data 
permanently.

I need to set up my `homelab` in a rational way to host all my data on premise with replication.

**resiliency:** I need solutions that will keep my data and service available and recoverable through the years.
Right now I am thinking of using containers as much as practical to decouple my services from regular OS upkeep, 
allow me to spin anything back up from configuration and resilient storage.

**autonomy:** Although I will need to settle on commercial hosting solutions for off-site backup, I wish to have 
all my software and data on premise and not tide to any 3rd party.

**security:** The hard one, I need to be diligent and secure all this. My idea would be at first to isolate 
everything and provide only access through a well secured vpn.



## Requirements

* self-hosted git server with replication to github
* secret vault (most likely openbao)
* kubernetes cluster with ansible scripts creation
* SAN/NAS solution with off-site backup
* VM platform (xcp-ng?)
* VPN endpoint
* certificate automation
* self-hosted docs solution
* self-hosted media center

nice to have:

* mirror repo
* lan caching
* image pipeline

