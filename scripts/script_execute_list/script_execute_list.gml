/// @function return script_execute_list(script, args)
/// @arg script
/// @arg args

var _args = argument1;

switch (ds_list_size(_args)) {
	
    case 1:  return script_execute(argument0, _args[| 0]);  
		 	
	case 2:  return script_execute(argument0, _args[| 0], _args[| 1]);  
		 	
	case 3:  return script_execute(argument0, _args[| 0], _args[| 1], _args[| 2]);  
		 	
	case 4:  return script_execute(argument0, _args[| 0], _args[| 1], _args[| 2], _args[| 3]);  
		 	
	case 5:  return script_execute(argument0, _args[| 0], _args[| 1], _args[| 2], _args[| 3], _args[| 4]);  
		 	
	case 6:  return script_execute(argument0, _args[| 0], _args[| 1], _args[| 2], _args[| 3], _args[| 4], _args[| 5]);  
		 	
	case 7:  return script_execute(argument0, _args[| 0], _args[| 1], _args[| 2], _args[| 3], _args[| 4], _args[| 5], _args[| 6]);  
		 	
	case 8:  return script_execute(argument0, _args[| 0], _args[| 1], _args[| 2], _args[| 3], _args[| 4], _args[| 5], _args[| 6], _args[| 7]);  
		 	
	case 9:  return script_execute(argument0, _args[| 0], _args[| 1], _args[| 2], _args[| 3], _args[| 4], _args[| 5], _args[| 6], _args[| 7], _args[| 8]);  
		 	
	case 10: return script_execute(argument0, _args[| 0], _args[| 1], _args[| 2], _args[| 3], _args[| 4], _args[| 5], _args[| 6], _args[| 7], _args[| 8], _args[| 9]);  
		 	
	case 11: return script_execute(argument0, _args[| 0], _args[| 1], _args[| 2], _args[| 3], _args[| 4], _args[| 5], _args[| 6], _args[| 7], _args[| 8], _args[| 9], _args[| 10]);  
		 	
	case 12: return script_execute(argument0, _args[| 0], _args[| 1], _args[| 2], _args[| 3], _args[| 4], _args[| 5], _args[| 6], _args[| 7], _args[| 8], _args[| 9], _args[| 10], _args[| 11]);  
		 	
	case 13: return script_execute(argument0, _args[| 0], _args[| 1], _args[| 2], _args[| 3], _args[| 4], _args[| 5], _args[| 6], _args[| 7], _args[| 8], _args[| 9], _args[| 10], _args[| 11], _args[| 12]);  
		 	
	case 14: return script_execute(argument0, _args[| 0], _args[| 1], _args[| 2], _args[| 3], _args[| 4], _args[| 5], _args[| 6], _args[| 7], _args[| 8], _args[| 9], _args[| 10], _args[| 11], _args[| 12], _args[| 13]);  
		 	
	case 15: return script_execute(argument0, _args[| 0], _args[| 1], _args[| 2], _args[| 3], _args[| 4], _args[| 5], _args[| 6], _args[| 7], _args[| 8], _args[| 9], _args[| 10], _args[| 11], _args[| 12], _args[| 13], _args[| 14]);  
		 	
	case 16: return script_execute(argument0, _args[| 0], _args[| 1], _args[| 2], _args[| 3], _args[| 4], _args[| 5], _args[| 6], _args[| 7], _args[| 8], _args[| 9], _args[| 10], _args[| 11], _args[| 12], _args[| 13], _args[| 14], _args[| 15]); 
		
    default: show_error("return script_execute_array: argument count not supported!", false); 
}