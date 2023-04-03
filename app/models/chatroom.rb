class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :booking

end

## For chatroom flow
# 1.Install:  yarn add @rails/actioncable
# 2.Install database to store memory [Redis]
## On macOS 
# brew update
# brew install redis
# brew services start redis
## On Ubuntu
# sudo apt-get install redis-server 
## 3.If you want to flush your redis store, run [If needed]
# redis-cli flushall