// Generated by gencpp from file antobot_msgs/UInt16_Array.msg
// DO NOT EDIT!


#ifndef ANTOBOT_MSGS_MESSAGE_UINT16_ARRAY_H
#define ANTOBOT_MSGS_MESSAGE_UINT16_ARRAY_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace antobot_msgs
{
template <class ContainerAllocator>
struct UInt16_Array_
{
  typedef UInt16_Array_<ContainerAllocator> Type;

  UInt16_Array_()
    : data()  {
    }
  UInt16_Array_(const ContainerAllocator& _alloc)
    : data(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<uint16_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<uint16_t>> _data_type;
  _data_type data;





  typedef boost::shared_ptr< ::antobot_msgs::UInt16_Array_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::antobot_msgs::UInt16_Array_<ContainerAllocator> const> ConstPtr;

}; // struct UInt16_Array_

typedef ::antobot_msgs::UInt16_Array_<std::allocator<void> > UInt16_Array;

typedef boost::shared_ptr< ::antobot_msgs::UInt16_Array > UInt16_ArrayPtr;
typedef boost::shared_ptr< ::antobot_msgs::UInt16_Array const> UInt16_ArrayConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::antobot_msgs::UInt16_Array_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::antobot_msgs::UInt16_Array_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::antobot_msgs::UInt16_Array_<ContainerAllocator1> & lhs, const ::antobot_msgs::UInt16_Array_<ContainerAllocator2> & rhs)
{
  return lhs.data == rhs.data;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::antobot_msgs::UInt16_Array_<ContainerAllocator1> & lhs, const ::antobot_msgs::UInt16_Array_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace antobot_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::antobot_msgs::UInt16_Array_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::antobot_msgs::UInt16_Array_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::antobot_msgs::UInt16_Array_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::antobot_msgs::UInt16_Array_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::antobot_msgs::UInt16_Array_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::antobot_msgs::UInt16_Array_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::antobot_msgs::UInt16_Array_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e066daa5966378a57445687eb65bfa3b";
  }

  static const char* value(const ::antobot_msgs::UInt16_Array_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe066daa5966378a5ULL;
  static const uint64_t static_value2 = 0x7445687eb65bfa3bULL;
};

template<class ContainerAllocator>
struct DataType< ::antobot_msgs::UInt16_Array_<ContainerAllocator> >
{
  static const char* value()
  {
    return "antobot_msgs/UInt16_Array";
  }

  static const char* value(const ::antobot_msgs::UInt16_Array_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::antobot_msgs::UInt16_Array_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint16[] data\n"
;
  }

  static const char* value(const ::antobot_msgs::UInt16_Array_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::antobot_msgs::UInt16_Array_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct UInt16_Array_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::antobot_msgs::UInt16_Array_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::antobot_msgs::UInt16_Array_<ContainerAllocator>& v)
  {
    s << indent << "data[]" << std::endl;
    for (size_t i = 0; i < v.data.size(); ++i)
    {
      s << indent << "  data[" << i << "]: ";
      Printer<uint16_t>::stream(s, indent + "  ", v.data[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // ANTOBOT_MSGS_MESSAGE_UINT16_ARRAY_H
