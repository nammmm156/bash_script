# Dự án tự động hóa các quy trình trong Linux

## CPU Monitoring

Vấn đề chúng ta gặp phải ở đây chính là khi sử dụng lệnh  ```scp``` thì sẽ cần phải nhập password. Nhưng khi chạy 1 cronjob thì công đoạn này rất khó để thực hiện, vì vậy ở đây chúng ta sẽ cần tạo một SSH key và sau đó copy public key đến máy đích. Để thực hiện điều đó, đầu tiên ta sẽ dùng lệnh: 

```bash
ssh-keygen -t rsa -b 4096 -C "namduongduc123@gmail.com"
```
để tạo ra cặp SSH key.

Khi được hỏi nơi lưu khóa, nhấn Enter để dùng mặc định: ```~/.ssh/id_rsa```.
Phần Passphrase khi được hỏi thì cần phải để trống.

Khi hoàn thành thì sẽ có 2 file được tạo lần lượt là:
```bash
~/.ssh/id_rsa (khóa riêng tư)
~/.ssh/id_rsa.pub (khóa công khai)
```
Sau đó ta sẽ dùng lệnh:
```bash
ssh-copy-id ducnam@192.168.6.111
```
để gửi khóa công khai sang máy đích và bạn sẽ nhập mật khẩu như thường. Và sau khi hoàn thành thì bạn sẽ không cần nhập mật khẩu ở những lần sau nữa.

