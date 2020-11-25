FROM mcr.microsoft.com/dotnet/sdk:3.1

# <becky bodging>
# RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
# RUN ls ~/.nvm
# RUN cat ~/.bashrc
# RUN nvm install -lts

# </becky bodging>

#<tim bodging>
RUN apt-get update && apt-get upgrade -y && \
      apt-get install -y nodejs
# RUN curl -sL https://deb.nodesource.com/setup_12.x | bash 

RUN curl https://www.npmjs.com/install.sh | bash

#</tim bodging>

COPY . /thing
WORKDIR /thing
RUN dotnet build

WORKDIR /thing/DotnetTemplate.Web
# RUN apt-get update && apt-get upgrade -y && \
#     apt-get install -y nodejs npm
# RUN npm install npm@latest -g
RUN npm install && \
     npm run build



EXPOSE 5000

ENTRYPOINT ["dotnet", "run"]
# FIRE AGAIN

# tell me in you want me to run again @alex
# Hey! We have an idea. Could you try not copying your whole project over to the docker build environment (esp. node_modules)
# Probably explains why it errors with saying that it can find Windows bindings
# What does it want? everything except node_modules?
# Well no "binaries" really (e.g. target folders)
# So ignore everything in .gitignore? IIRC one can use a .dockerignore - would that do it?
# Yes that should (hopefully) do it (at least I can't see any reason why not)
# Is there a more obvious/natural/friendly to copy a subset of stuff over?
# Often it's better to be explicit (i.e. opt-in) rather than opt-out if you fully understand what's needed to be copied
# However keep in mind that somebody might trip up on this later (i.e. addind some files expecting it to be available in the container)
# pls come visit us
# Maybe after Charlie (who also needs rescuing)
# Fairy nuff
# Shall we just start with a cheat working dockerfile? Or is the issue that this doesn't exist
# It *does* exist, you just have to delete any pre-existing node_modules folder
# But you should probably spend a little longer getting the dockerfile working
# okok understood