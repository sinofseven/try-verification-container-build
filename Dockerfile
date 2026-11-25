FROM public.ecr.aws/lambda/provided:al2023

RUN dnf install -y gcc gcc-c++ make

RUN curl -L -o eza.zip https://github.com/eza-community/eza/releases/download/v0.23.5/eza_aarch64-unknown-linux-gnu_no_libgit.zip -l
RUN unzip eza.zip
RUN mv eza /usr/local/bin/

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal

ENV HOME="/root"
ENV PATH="${HOME}/.cargo/bin:${PATH}"

RUN cargo install firecrawl-local

RUN eza -l ~/.cargo/bin