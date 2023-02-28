# FROM ubuntu:22.04

# RUN curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash
# RUN sudo apt install -y nodejs
# RUN sudo apt npm install -g yarn

# 프로젝트가 아닌 도커안의 환경
# RUN mkdir class_build => 아래에서 copy할때 자동으로 만들어짐
FROM node:16

COPY ./package.json /class_build/
COPY ./yarn.lock /class_build/
WORKDIR /class_build/
RUN yarn install


COPY . /class_build/
RUN yarn build
CMD yarn start