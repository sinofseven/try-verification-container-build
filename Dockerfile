FROM public.ecr.aws/lambda/provided:al2023

RUN dnf install -y gcc gcc-c++ make

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal

ENV HOME="/root"
ENV PATH="${HOME}/.cargo/bin:${PATH}"

RUN cargo install firecrawl-local