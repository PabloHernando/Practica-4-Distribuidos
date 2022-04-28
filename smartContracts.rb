def get_smartContracts_data

	contracts_block ||= []
	blank_contract = Hash[contractor: "", hired: "",
													 condition: "", price: ""]
	loop do
        puts "" 
		puts "Do you want to add a contract? (Y/n)"
		new_contract = gets.chomp.downcase

		if new_contract == "y"
			puts "" 
            puts "Enter the name of the contractor"
            contractor = gets.chomp
            puts "" 
            puts "enter the name of the hired person"
            hired = gets.chomp
            puts "" 
            puts "Enter the condiction for the contract"
            condition  = gets.chomp
            puts "" 
            puts "Enter the price for the contract"
            price 	 = gets.chomp


            contract = Hash[contractor: "#{contractor}", hired: "#{hired}",
                                                            condition: "#{condition}", price: "#{price}"]
            contracts_block << contract

		else
			return contracts_block
			break
            break
		end
	end
end