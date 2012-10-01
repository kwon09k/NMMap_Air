package nmmap.vo
{
	public interface ILocation
	{
		function get postalCode():int;
		function get country():String;
		function get state():String;
		function get city():String;
		function get street2():String;
		function get street1():String;
	}
}