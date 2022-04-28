class Block
  attr_reader :index, :timestamp, :transactions, 
							:transactions_count, :previous_hash, 
							:nonce, :hash 

  def initialize(index, transactions, smartContracts, previous_hash)
    @index         		 	 = index
    @timestamp      	 	 = Time.now
    @transactions 	 		 = transactions
		@transactions_count  = transactions.size
    @smartContracts 	 		 = smartContracts
		@smartContracts_count  = smartContracts.size
    @previous_hash 		 	 = previous_hash
    @nonce, @hash  		 	 = compute_hash_with_proof_of_work
  end

	def compute_hash_with_proof_of_work(difficulty="00")
		nonce = 0
		loop do 
			hash = calc_hash_with_nonce(nonce)
			if hash.start_with?(difficulty)
				return [nonce, hash]
			else
				nonce +=1
			end
		end
	end
	
  def calc_hash_with_nonce(nonce=0)
    sha = Digest::SHA256.new
    sha.update( nonce.to_s + 
								@index.to_s + 
								@timestamp.to_s + 
								@transactions.to_s + 
								@transactions_count.to_s +	
								@previous_hash )
    sha.hexdigest 
  end

  def self.first( transactions, smartContracts )    # Create genesis block
    ## Uses index zero (0) and arbitrary previous_hash ("0")
    Block.new( 0, transactions, smartContracts, "0" )
  end

  def self.next( previous, transactions, smartContracts )
    Block.new( previous.index+1, transactions, smartContracts, previous.hash )
  end
end  # class Block
