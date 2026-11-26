FROM public.ecr.aws/lambda/provided:al2023 AS build

RUN dnf install -y gcc gcc-c++ make

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal

ENV HOME="/root"
ENV PATH="${HOME}/.cargo/bin:${PATH}"

RUN cargo install firecrawl-local

FROM public.ecr.aws/lambda/provided:al2023

RUN dnf install -y jq && dnf clean all
COPY --from=build /root/.cargo/bin/firecrawl-local /usr/local/bin/firecrawl-local
COPY bootstrap /var/runtime/bootstrap
RUN chmod 755 /var/runtime/bootstrap
