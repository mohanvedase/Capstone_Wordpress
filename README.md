# DEVOPS KNOWLEDGE HUB



## Table of contents
1. Setting Up the AWS Lightsail Instance 
2. Docker Installation
3. Deploying WordPress with Docker
4. Building the Informative and Attractive Blog Website
5. Domain Hosting with Online Cloud 
6. Automating Backups with Bash Script
7. Building and Pushing Docker Image to Docker Hub
## Setting Up the AWS Lightsail Instance 

### Launching a Lightsail Instance
1. Log in and Choose Instance Creation:
    - Head to the AWS Lightsail console and sign in to your account.
    - On the Lightsail homepage, navigate to the "Instances" section and click on "Create instance".
    
2. Specify Location and Blueprint:
    - Region and Availability Zone: Choose the AWS Region closest to your target audience for optimal performance. Availability Zones provide redundancy within a Region. You can keep the defaults for now.    - Blueprint or OS Image: Here, you select the software that will run on your instance. Lightsail offers various blueprints (pre-configured applications like WordPress) or standard OS images (like Ubuntu, and Amazon Linux). Choose the one that aligns with your needs.
    
3. Pick an Instance Plan:

    - Lightsail provides different instance plans with varying combinations of CPU cores, RAM, and storage. Select a plan that offers enough resources for your application to function smoothly. Consider starting with a lower-tier plan and scaling up if needed.
    
4. Configure Instance Details:
    - Instance Name: Provide a descriptive name for your instance for easy identification.
    - SSH Key Pair : If you plan to connect to your instance via SSH, create or choose an existing key pair for secure access.
    - Networking: Lightsail offers dual-stack (IPv4 and IPv6) or IPv6-only networking options. Select the appropriate one based on your application's requirements.
    
5. Launch the Instance:

    - Once you've reviewed all the configurations, click on "Create instance" to launch your Lightsail instance.
  
### Docker Installation :

    - Connect to your Lightsail instance using SSH and your key pair.

    - In your terminal window, run:

    '''
    docker version
    '''
    - If Docker is already installed, you'll see the Docker Engine version details.
    - If not, proceed with the installation steps below.
    - Installing Docker on Ubuntu/Debian:
    - Update your package lists:

    - sudo apt update

    - Install Docker Engine, containerd, and Docker Compose:

     sudo apt install docker-ce docker-ce-cli containerd docker-compose

    - ![image](https://github.com/mohanvedase/Capstone_Wordpress/assets/139565500/3fa4d2fd-bb16-4afa-b541-ab2a66de0c79)


    - Verifying Installation:
      ...
      docker version
      ...
    - This should now display Docker version information, confirming a successful installation.

### Deploying WordPress with Docker Compose: A Step-by-Step Guide
The provided Docker Compose script looks well-structured and sets up a multi-container environment for WordPress with MariaDB and phpMyAdmin. Let's break down the deployment process using your script:

Prerequisites:

Ensure Docker is installed and running on your Ubuntu-based Lightsail instance (as covered in the previous steps).
Create a project directory on your Lightsail instance for your WordPress installation (e.g., mkdir wordpress-docker).
Navigate to your project directory: cd wordpress-docker
1. Creating the .env file:

   - The script utilizes an .env file to store sensitive information like passwords. Create a file named .env in your project directory and add the following environment variables, replacing placeholders with your desired values:

      MYSQL_ROOT_PASSWORD=your_mysql_root_password
      MYSQL_DATABASE=your_database_name
      MYSQL_USER=your_database_user
      MYSQL_PASSWORD=your_database_password
2. Saving the Docker Compose script:

    - Create a file named docker-compose.yml in your project directory and paste the provided Docker Compose script you shared. This script defines the configuration for your multi-container application.

3. Starting the WordPress environment:

    - Now that you have the .env file and docker-compose.yml set up, initiate the deployment process by running the following command in your terminal:

      '''
      docker-compose up -d
      '''
    -  The docker-compose up command builds and starts the services defined in docker-compose.yml.
    - The -d flag instructs Docker Compose to run the containers in detached mode, allowing them to run in the background.
4. Accessing the WordPress Dashboard:

    - Once the containers are up and running, you can access your WordPress installation through your web browser. Here's how:
    -  Find the public IP address of your Lightsail instance. You can locate this information in the Lightsail console under the "Networking" tab for your instance.
      Open a web browser and navigate to http://<your_lightsail_public_ip>:8080. This should open the WordPress welcome screen where you can complete the initial setup process.
5. Using phpMyAdmin:

    - The script also sets up phpMyAdmin for database management. You can access it at http://<your_lightsail_public_ip>:8081 using the MYSQL_ROOT_PASSWORD you defined in the .env file.
  
### 4. Building Your Informative and Attractive Blog Website with WordPress and Docker

Now that you have a functional WordPress environment on your Lightsail instance, let's customize it for your blog:

 -  Choosing a Theme: Astha Theme with Elementor Editor

 - Astha Theme: This theme seems like a great choice! It appears to be compatible with Elementor, a popular drag-and-drop page builder plugin. With Elementor, you can easily customize your website's layout 
       and design without needing to code.
      - Here are some things to consider when evaluating Astha:
      - Check the theme's documentation and reviews to ensure it meets your needs and offers functionalities you desire 
      - Consider the theme's support options in case you encounter any issues during setup or customization.

4.2. Installing and Configuring Plugins

- a) Starter Templates (Optional):
    Starter templates can provide a pre-built layout to jumpstart your website creation. However, with Elementor, you have a high degree of design flexibility, so using a starter template might not be   
  necessary.
- b) Elementor:
   Since you plan to use Elementor for customization, install the Elementor plugin from the WordPress plugin directory within your admin dashboard.
   Explore Elementor's documentation and tutorials to learn its functionalities for creating layouts, adding widgets, and customizing your website.
- c) Migration Plugin (Optional):
   If you're migrating existing blog content from another platform, you might need a migration plugin to transfer your posts and comments. Research plugins compatible with your source platform and 
    WordPress.
-  d) SMTP Server Plugin:
    To enable email functionality for your blog (e.g., contact form submissions), you'll need to configure an SMTP server. This typically involves using a plugin like WP Mail SMTP or Post SMTP. These 
           plugins allow you to connect your WordPress site to an external email service provider (ESP) like Gmail, SendGrid, etc., for sending emails.
           
4.3. Creating Pages and Blog Posts on Cloud Technologies (AWS, Jenkins, Terraform, Prometheus, Grafana):

    Adding pages like Home, Blogs, Reviews, and Contact Us is a straightforward process. Here's how you can achieve this using your WordPress dashboard:

 1. Creating Pages:
 -  Navigate to your WordPress admin dashboard.
 -  In the left-hand menu, hover over "Pages" and click on "Add New".
2. Building Each Page:

  -  **Home Page:** This is typically your website's landing page. You can use Elementor or the WordPress editor to create a visually appealing and informative homepage. Consider including elements like a 
   hero section with a compelling headline, a brief about your blog's focus, featured blog posts, and a call to action.
  - ![image](https://github.com/mohanvedase/Capstone_Wordpress/assets/139565500/83e04d55-53e9-43a4-a137-960860339c7a)
  - ![image](https://github.com/mohanvedase/Capstone_Wordpress/assets/139565500/583aca56-215b-4488-a989-f861d93cb9ef)

 
  - **Blog Page:** This page will likely display a list of your blog posts in a reverse chronological order (newest posts first). WordPress has a built-in "Blog" page template you can utilize for this 
     purpose. You can customize the layout and design using Elementor or the editor.
  -   ![image](https://github.com/mohanvedase/Capstone_Wordpress/assets/139565500/935cfcf8-075b-47a6-956e-25102a18254e)

  -  ![image](https://github.com/mohanvedase/Capstone_Wordpress/assets/139565500/fb8a499d-fe06-4ee4-896a-db3dc3401384)

  - **Reviews Page:** Create a new page for reviews. You can structure this page similarly to your blog page, listing your reviews. Consider using categories or tags to organize your reviews by topic or 
    product
  - ![image](https://github.com/mohanvedase/Capstone_Wordpress/assets/139565500/b32c124e-9f2c-407a-8d3e-99bf85a595fd)
  - ![image](https://github.com/mohanvedase/Capstone_Wordpress/assets/139565500/0084db1c-0ff6-4ba1-947d-650d674978d4)


    
  -  **Contact Us Page:** This page provides a way for visitors to connect with you. Include a contact form where visitors can submit messages, your email address, and any other relevant contact 
    information (e.g., social media links). Many contact form plugins are available, allowing you to create a user-friendly form for collecting inquiries.
  - ![image](https://github.com/mohanvedase/Capstone_Wordpress/assets/139565500/1b6949a0-fd91-4be9-b36b-e3a68c4da745)

  -  ![image](https://github.com/mohanvedase/Capstone_Wordpress/assets/139565500/6c597e87-c778-4789-b413-d07addb932e9)


  3. Setting Menus:
           Once you've created your pages, you need to add them to your website's navigation menu for visitors to access them easily.

-  In the WordPress admin dashboard, go to "Appearance" > "Menus".
- Click on "Create a new menu".
- Give your menu a name (e.g., "Main Navigation").
- In the "Pages" section on the left, check the boxes next to the pages you want to include (Home, Blog, Reviews, Contact Us).
- Click on "Add to Menu" to add them to your menu.
- Select a menu location from the "Menu Settings" section on the right (typically "Primary Menu" or "Header Menu"). This defines where the menu will appear on your website.
- Click on "Save Menu" to finalize the menu creation

- ![image](https://github.com/mohanvedase/Capstone_Wordpress/assets/139565500/c876d7ef-77a7-4907-be62-921e084495f3)



## 5. Domain Registration and Configuration with Lightsail

- While Lightsail offers some domain management features, it's not a primary domain registrar. Here's what you'll need to do:

#### Register your domain:
- Choose a domain registrar like Google Domains, Namecheap, or GoDaddy.
- Search for and register your desired domain name (e.g., onlinecloudschool.com).
#### Configure Nameservers :

- Most domain registrars allow you to manage your domain's nameservers. These servers point visitors to your website's location.
- If you plan to use Lightsail's DNS management for your domain (recommended for a simpler setup), update your domain's nameservers with the provided nameservers from Lightsail. You'll find these                     nameservers in the Lightsail console under the "Networking" tab > "Domain names".
- Pointing the Domain to your Lightsail Instance

   There are two main approaches to point your domain (onlinecloudschool.com) to your Lightsail instance running WordPress:
 #### Method 1: Using Lightsail DNS Management (Recommended):

- Create a DNS Zone in Lightsail (if not done already):

- ![image](https://github.com/mohanvedase/Capstone_Wordpress/assets/139565500/7d44a1e0-258e-4e20-bc42-045e3dff2b6c)


- In the Lightsail console, navigate to the "Networking" tab and choose "Domain names".
-  Click on "Create domain name" and follow the wizard to add your domain name (onlinecloudschool.com).
-   Add an A Record:

-  Once your DNS zone is created, navigate to the zone details and choose "Add record".
-  Select "A" record type.
- In the "Name" field, enter "@" (this signifies the root domain).
-  In the "Value" field, enter the public IP address of your Lightsail instance (3.110.136.100 in this case). Leave the port number (8080) out, as the default web server port (80) is assumed.
-  ![image](https://github.com/mohanvedase/Capstone_Wordpress/assets/139565500/d227d5de-54ef-4886-b8d8-a40005a59349)

#### ## Logging In, Creating Backups, and Automating the Process on Your Lightsail Instance

Here's a breakdown of the steps to log in, create backups, and automate the process on your Lightsail instance:

**1. Log in to your Lightsail Instance:**

There are two main ways to connect to your Lightsail instance:

- **SSH Client:** Use an SSH client like PuTTY (Windows/macOS) or the built-in terminal (Linux/macOS) to connect to your instance. You'll need your instance's public IP address, username, and private key pair for authentication.

- **Lightsail Console:** The Lightsail console offers a browser-based SSH terminal within the instance details section. This can be a convenient option for quick access.


**2. Creating a Manual Backup (Snapshot):**

While automating backups is ideal, here's how to create a manual snapshot for immediate backup purposes:

  - Open the Lightsail console and navigate to the "Instances" section.
  - Select your WordPress instance.
  - In the instance details section, under "Actions," click on "Create snapshot."
  - Choose a descriptive name for your snapshot (e.g., "manual-backup-2024-04-13").
  - Click on "Create snapshot" to initiate the backup process.
  - ![image](https://github.com/mohanvedase/Capstone_Wordpress/assets/139565500/e13aac22-ea84-4110-a3b3-511cdca68a8b)


**3. Automating Backups with Bash Script**

Here's how to set up an automated backup script:


**a) Creating the Script:**

  1. Use a text editor (e.g., nano, vi) to create a new file named `backup.sh` in a suitable location on your instance (e.g., `/home/your-username`).

  2. Paste the following script content into the file, replacing placeholders with your details:

  ```bash
  #!/bin/bash

  # Set date for backup filename
  DATE=$(date +"%Y-%m-%d")

  # Define S3 bucket name (replace with your bucket name)
  S3_BUCKET="your-s3-bucket-name"

  # Path to your WordPress directory (replace with your actual path)
  WP_DIR="/var/www/html"

  # Create a compressed backup archive of the WordPress directory
  tar -czvf wordpress_backup_${DATE}.tar.gz $WP_DIR

  # Upload the backup archive to your S3 bucket using the AWS CLI
  aws s3 cp wordpress_backup_${DATE}.tar.gz s3://${S3_BUCKET}/backups/

  # Remove the local backup archive (optional, to save space)
  rm wordpress_backup_${DATE}.tar.gz

  echo "Backup completed: wordpress_backup_${DATE}.tar.gz"
  ```
 - ![S3 backup](https://github.com/mohanvedase/Capstone_Wordpress/assets/139565500/6dd8b2ae-e77e-4cd6-8dec-9671ba57aa72)

  **Explanation:**

  - The script uses `date` to generate a timestamp for the backup filename.
  - Replace `your-s3-bucket-name` with the actual name of your S3 bucket where you'll store the backups.
  - Update `WP_DIR` with the path to your WordPress directory on your instance.
  - The script creates a compressed tar archive of your WordPress directory.
  - The `aws s3 cp` command uploads the archive to your S3 bucket using the AWS CLI (pre-installed on Lightsail instances). You might need to configure the AWS CLI with your access key and secret key (refer to AWS documentation).
  - The script optionally removes the local backup archive after uploading to S3.

  3. Save and close the script file.

**b) Configuring AWS S3 Bucket for Storage:**

  1. In the AWS Management Console, navigate to the S3 service.
  2. Create a new S3 bucket (if you don't have one already) to store your backups. Choose a globally unique name for your bucket.
  3. Set appropriate access permissions for the bucket. You can restrict access for enhanced security. Refer to the AWS documentation for S3 bucket access control: [https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-bucket-policies.html](https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-bucket-policies.html)

**c) Scheduling Backups:**

  1. Use the crontab utility to schedule automatic execution of your backup script.
  2. Open your crontab for editing: `crontab -e`
  3. Add a new line with the desired scheduling interval. For example, to run the backup script every day at midnight (12:00 AM), add the following line:

  ```
  0 0 * * * /home/your-username/backup.sh
  ```

  - This line specifies that the script will run at minute 0, hour 0 (midnight), on all days of the month (*), of all months (*), and of all days.
## Pushing a Docker Image for Your WordPress Website

Here's a guide to building and pushing a Docker image containing your WordPress website to Docker Hub:

**7.1. Creating a Dockerfile:**

1. Create a new file named `Dockerfile` in the same directory as your WordPress codebase (outside the WordPress directory itself).

2. Paste the following content into the `Dockerfile`, replacing placeholders with your details:

```dockerfile
FROM wordpress:latest

# Set working directory within the container
WORKDIR /var/www/html

# Copy WordPress files from the current directory
COPY . .

# Install dependencies within the container
RUN apt-get update && apt-get install -y php7.4-xml php7.4-mbstring php7.4-curl php7.4-gd

# Expose the default WordPress port (80)
EXPOSE 80

# Run the default CMD for the WordPress image (starts Apache)
CMD ["apache2-foreground"]
```

**Explanation:**

- The `FROM` line specifies the base image, which is `wordpress:latest` in this case. This image provides a pre-configured WordPress environment.
- The `WORKDIR` line sets the working directory within the container.
- The `COPY` line copies your entire WordPress codebase (including plugins, themes, etc.) from the current directory into the container's working directory.
- The `RUN` line installs necessary PHP dependencies within the container to ensure proper functionality.
- The `EXPOSE` line exposes port 80, the default port for web traffic in your WordPress application.
- The `CMD` line defines the default command to run when the container starts. Here, it uses the `apache2-foreground` command to keep the Apache web server running in the foreground.

**7.2. Building the Docker Image:**

1. Open a terminal in the directory containing your `Dockerfile`.
2. Run the following command to build the Docker image:

```bash
docker build -t your-username/wordpress-app:latest .
```

  - Replace `your-username` with your actual Docker Hub username.
  - The `-t` flag specifies the tag for your image. Here, it's named `your-username/wordpress-app:latest`. You can customize the tag name as needed.
  - The `.` at the end specifies the context (current directory) for building the image.

**7.3. Pushing the Image to Docker Hub:**

1. Log in to your Docker Hub account using the following command in your terminal:

```bash
docker login
```

2. Enter your Docker Hub username and password when prompted.

3. Push the built image to your Docker Hub repository using the following command:

```bash
docker push your-username/wordpress-app:latest
```
- ![docker push](https://github.com/mohanvedase/Capstone_Wordpress/assets/139565500/d0b78409-dc22-4201-8d6b-3be1c255d80a)


## Deployment Architecture

- ![Capstone drawio](https://github.com/mohanvedase/Capstone_Wordpress/assets/139565500/84285615-0d6f-4cce-93d9-4a2c2dd7934a)

## Cost Estimation

- ![image](https://github.com/mohanvedase/Capstone_Wordpress/assets/139565500/616cd281-a841-4578-8537-93d896937719)


