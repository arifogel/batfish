package org.batfish.dataplane.rib;

import java.util.Set;
import org.batfish.datamodel.Ip;
import org.batfish.datamodel.Prefix;
import org.batfish.datamodel.PrefixTrieMultiMap;

public final class RibResolutionTrie {

  private static final class ResolutionTrieValue {}

  private static final ResolutionTrieValue PREFIX = new ResolutionTrieValue();

  private static final ResolutionTrieValue NHIP = new ResolutionTrieValue();

  private final PrefixTrieMultiMap<ResolutionTrieValue> _prefixesAndNextHops;

  public RibResolutionTrie() {
    _prefixesAndNextHops = new PrefixTrieMultiMap<>();
  }

  public void addPrefix(Prefix prefix) {
    _prefixesAndNextHops.put(prefix, PREFIX);
  }

  public void removePrefix(Prefix prefix) {
    _prefixesAndNextHops.remove(prefix, PREFIX);
  }

  public void addNextHopIp(Ip nextHopIp) {
    _prefixesAndNextHops.put(Prefix.create(nextHopIp, Prefix.MAX_PREFIX_LENGTH), NHIP);
  }

  public void removeNextHopIp(Ip nextHopIp) {
    _prefixesAndNextHops.remove(Prefix.create(nextHopIp,Prefix.MAX_PREFIX_LENGTH), NHIP);
  }

  public Set<Ip> getAffectedNextHopIps(Prefix newPrefix) {
    _prefixesAndNextHops.longestPrefixMatch()
  }
}
