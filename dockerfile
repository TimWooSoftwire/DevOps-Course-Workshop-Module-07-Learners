FROM mcr.microsoft.com/dotnet/sdk:3.1 as builder

RUN apt-get update && apt-get upgrade -y && \
      apt-get install -y nodejs

RUN curl https://www.npmjs.com/install.sh | bash

COPY . /thing
WORKDIR /thing
RUN dotnet build

WORKDIR /thing/DotnetTemplate.Web
RUN npm install && \
     npm run build


FROM mcr.microsoft.com/dotnet/aspnet:3.1
WORKDIR /thing
COPY --from=builder /thing .

EXPOSE 5000

ENTRYPOINT ["dotnet", "run"]
