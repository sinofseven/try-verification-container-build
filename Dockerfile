FROM public.ecr.aws/lambda/provided:al2023

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal

ENV PATH="${HOME}/.cargo/bin:${PATH}"

RUN cargo --version