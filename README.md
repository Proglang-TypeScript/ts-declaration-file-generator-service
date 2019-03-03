## Typescript declaration files generator service

### Installation
#### Docker
Install Docker.
https://docs.docker.com/install/

#### Clone this repository

```shell
git clone https://fcristiani@bitbucket.org/fcristiani/ts-declaration-file-generator-service.git
```

#### Install
```shell
cd ts-declaration-file-generator-service
```

```shell
./install.sh
```

### Usage
#### Generate a Typescript declaration file from Javascript code


```shell
./bin/run.sh [JS-FILE] [TYPESCRIPT-MODULE-NAME] [OUTPUT_DIRECTORY]
```


#### Example
You can use the example provided in this repo under `example/calculator.js`.

```shell
./bin/run.sh examples/calculator.js calculator /tmp/ts-declaration-file-generator-service
```

You will find the declaration file under `/tmp/ts-declaration-file/calculator/index.d.ts`:

```shell
cat /tmp/ts-declaration-file/calculator/index.d.ts
```

```typescript
export = calculator

declare namespace calculator {
        export function sum(a: number, b: number): number
}
```