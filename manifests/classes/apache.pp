
class apache {
      notify { 'apache': }
}

class apache::apache {
      notify { 'apache::app': }
}

