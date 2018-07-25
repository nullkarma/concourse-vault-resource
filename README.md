# Source Config

- `host` _required_: https://domain.tld:8200
- `token` _required_: Vault Token
- `secret` _required_: Path to KV Secret

## Example

### Resource definition

```yaml
resource:
- name: vault
  type: vault
  source:
    host: https://domain.tld:8200
    token: a-b-c-d
    secret: /some/secret
```

### Fetching secrets

```yaml
- get: vault
```

### Pushig into secrets

```yaml
- put: vault
  params:
    key: some/other/secret
    kv2: false
```

# Behaviour

## `check`: Check for new versions

kv secrets: Returns current timestamp.
kv2 secrets: Return the version read from the metadata.

## `in`: Read kv secrets

key/values will be stored on disk as JSON with a directory structure as `source:secret`.
`secret: my/secret/foo` will create `vault/my/secret/foo.json`

## `out` Write to kv secret

### Parameters

- `key` _required_: The secret to write to
- `kv2` _optional_: If set to `true`, the `key` will be treated as KV Version 2 data. (default: `false`)


