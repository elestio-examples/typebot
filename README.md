# Typebot CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/typebot"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Deploy Typebot server with CI/CD on Elestio

<img src="typebot.png" style='width: 100%;'/>
<br/>
<br/>

# Once deployed ...

You can open Typebot Builder UI here:

    URL: https://[CI_CD_DOMAIN]:8443
    Login: [ADMIN_EMAIL]


# Custom domain instructions (IMPORTANT)

By default we set up a CNAME on elestio.app domain, but probably you will want to have your own domain.

***Step1:*** Add your domain in the Elestio dashboard as explained here:

    https://docs.elest.io/books/security/page/custom-domain-and-automated-encryption-ssltls

***Step2:*** Update the environment variables to reflect your custom domain Open Elestio dashboard > Service overview > Click on the Update CONFIG button > Env tab there edit 'NEXTAUTH_URL',  'NEXT_PUBLIC_VIEWER_URL'  &  'MINIO_ENDPOINT' with your real domain and click the button 'Update & Restart'.
