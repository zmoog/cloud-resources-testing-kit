# SQS

## Create cloud resources

```shell
export TF_VAR_owner="mbranca"

terraform init 
terraform apply
```

## Set up environment variables

All send/receive/delete commands require a `--queue-url` option, so we will set an environment variable using the `aws sqs get-queue-url`:

```shell
export QUEUE_URL="$(aws sqs get-queue-url --queue-name ${TF_VAR_owner}-example-queue --output text)"
```

## Collect metrics 

### Receive message (empty queue)

```shell
$ aws sqs receive-message --queue-url ${QUEUE_URL}
```

Generates the following metrics:

- `NumberOfEmptyReceives`


### Send a message

```shell
$ aws sqs send-message --queue-url ${QUEUE_URL} --message-body="Hello world"
{
    "MD5OfMessageBody": "3e25960a79dbc69b674cd4ec67a72c62",
    "MessageId": "0df3d980-d2b3-42e1-a72b-325aaa62ec7c"
}
```

Generates the following metrics:

- `NumberOfMessagesReceived`
- `ApproximateAgeOfOldestMessage`


### Receive message (non empty queue)

```shell
$ aws sqs receive-message --queue-url ${QUEUE_URL}
{
    "Messages": [
        {
            "MessageId": "0df3d980-d2b3-42e1-a72b-325aaa62ec7c",
            "ReceiptHandle": "AQEB3..../2//A==",
            "MD5OfBody": "3e25960a79dbc69b674cd4ec67a72c62",
            "Body": "Hello world"
        }
    ]
}
```

Generates the following metrics:

- `ApproximateNumberOfMessagesNotVisible`


### Delete message

```shell
$ aws sqs delete-message --queue-url ${QUEUE_URL} --receipt-handle ""
```

Generates the following metrics:

- `NumberOfMessagesDeleted`
