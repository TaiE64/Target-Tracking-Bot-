// Generated by gencpp from file antobot_msgs/softShutdownRequest.msg
// DO NOT EDIT!


#ifndef ANTOBOT_MSGS_MESSAGE_SOFTSHUTDOWNREQUEST_H
#define ANTOBOT_MSGS_MESSAGE_SOFTSHUTDOWNREQUEST_H


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
struct softShutdownRequest_
{
  typedef softShutdownRequest_<ContainerAllocator> Type;

  softShutdownRequest_()
    : softshutdownreq(false)  {
    }
  softShutdownRequest_(const ContainerAllocator& _alloc)
    : softshutdownreq(false)  {
  (void)_alloc;
    }



   typedef uint8_t _softshutdownreq_type;
  _softshutdownreq_type softshutdownreq;





  typedef boost::shared_ptr< ::antobot_msgs::softShutdownRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::antobot_msgs::softShutdownRequest_<ContainerAllocator> const> ConstPtr;

}; // struct softShutdownRequest_

typedef ::antobot_msgs::softShutdownRequest_<std::allocator<void> > softShutdownRequest;

typedef boost::shared_ptr< ::antobot_msgs::softShutdownRequest > softShutdownRequestPtr;
typedef boost::shared_ptr< ::antobot_msgs::softShutdownRequest const> softShutdownRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::antobot_msgs::softShutdownRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::antobot_msgs::softShutdownRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::antobot_msgs::softShutdownRequest_<ContainerAllocator1> & lhs, const ::antobot_msgs::softShutdownRequest_<ContainerAllocator2> & rhs)
{
  return lhs.softshutdownreq == rhs.softshutdownreq;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::antobot_msgs::softShutdownRequest_<ContainerAllocator1> & lhs, const ::antobot_msgs::softShutdownRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace antobot_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::antobot_msgs::softShutdownRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::antobot_msgs::softShutdownRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::antobot_msgs::softShutdownRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::antobot_msgs::softShutdownRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::antobot_msgs::softShutdownRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::antobot_msgs::softShutdownRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::antobot_msgs::softShutdownRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "264b76d04f2863905b6aba0e5f5b18a0";
  }

  static const char* value(const ::antobot_msgs::softShutdownRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x264b76d04f286390ULL;
  static const uint64_t static_value2 = 0x5b6aba0e5f5b18a0ULL;
};

template<class ContainerAllocator>
struct DataType< ::antobot_msgs::softShutdownRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "antobot_msgs/softShutdownRequest";
  }

  static const char* value(const ::antobot_msgs::softShutdownRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::antobot_msgs::softShutdownRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool softshutdownreq\n"
;
  }

  static const char* value(const ::antobot_msgs::softShutdownRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::antobot_msgs::softShutdownRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.softshutdownreq);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct softShutdownRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::antobot_msgs::softShutdownRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::antobot_msgs::softShutdownRequest_<ContainerAllocator>& v)
  {
    s << indent << "softshutdownreq: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.softshutdownreq);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ANTOBOT_MSGS_MESSAGE_SOFTSHUTDOWNREQUEST_H
