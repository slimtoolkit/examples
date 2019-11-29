FROM rust:1.36

COPY service /opt/my/service

WORKDIR /opt/my/service

RUN rustc --version && \
	cargo build --release && \
	cp target/release/rust-service .

EXPOSE 1300
ENTRYPOINT ["/opt/my/service/rust-service"]
