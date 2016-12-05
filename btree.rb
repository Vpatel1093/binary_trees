class Node
	attr_accessor :value, :parent, :left, :right
	
	def initialize(value, parent, left, right)
		@value = value
		@parent = parent
		@left = left
		@right = right
	end
end

class BTree
	attr_accessor :arr, :root

	def initialize(arr)
		@arr = arr
		@root = Node.new(arr[0], nil, nil, nil)
	end
	
	def build_tree
		arr.each do |node|
			add(node)
		end
	end
	
	def add(value, current_node = root)
		unless value == current_node.value
			if value < current_node.value
				current_node.left.nil? ? current_node.left = Node.new(value, current_node, nil, nil) : add(value, current_node.left)
			else
				current_node.right.nil? ? current_node.right = Node.new(value, current_node, nil, nil) : add(value, current_node.right)
			end
		end
	end
	
	def breadth_first_search(value)
		queue = [root]
		until queue.empty?
			current_node = queue.shift
			return current_node.value if current_node.value == value
			queue.push(current_node.left) unless current_node.left.nil?
			queue.push(current_node.right) unless current_node.right.nil?
		end
		nil
	end
			
	def depth_first_search(value)
		stack = [root]
		until stack.empty?
			current_node = stack.pop
			return current_node.value if current_node.value == value
			stack.push(current_node.left) unless current_node.left.nil?
			stack.push(current_node.right) unless current_node.right.nil?
		end
		nil
	end
			
	def dfs_rec(value, current_node = root)
		return current_node.value if current_node.value == value
		unless current_node.left.nil?
			result = dfs_rec(value, current_node.left)
			return result unless result.nil?
		end
		unless current_node.right.nil?
			result = dfs_rec(value, current_node.right)
			return result unless result.nil?
		end
		nil
	end			
end
