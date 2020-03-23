#!/bin/bash

echo Password12345 | sudo sh -c 'echo root:Password12345' | chpasswd
echo Password12345 | su