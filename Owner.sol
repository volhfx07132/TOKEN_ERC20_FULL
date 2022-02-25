pragma solidity >=0.7.0 <0.9.0;
import "./Context.sol";

contract CheckDemo is Context{
    address public _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor(){
        address msgSender = _msgSender();
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    function initOwnable() internal {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    function owner() public view virtual returns(address){
        return _owner;
    }

    modifier onlyOwner(){
        require(owner() == _msgSender(), "Ownable: caller is nit the owner");
        _;
    }

     function transferOwnership(address newOWner) public virtual onlyOwner {
         require(newOWner != address(0), "Ownable: new owner is the zero address");
         emit OwnershipTransferred(_owner, newOWner);
         _owner = newOWner;
     }

}